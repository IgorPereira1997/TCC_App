import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as serviceAccount from "./serviceAccountKey.json";

admin.initializeApp({
  credential: admin.credential.cert({
    projectId: serviceAccount.project_id,
    privateKey: serviceAccount.private_key.replace(/\\n/g, "\n"),
    clientEmail: serviceAccount.client_email,
  }),
  databaseURL: serviceAccount.database_url,
});

export const checkFieldValueExists = functions.https.onCall(
  async (data, context) => {
    const {collectionPath, fieldName, value} = data;

    try {
    // Query the collection for documents where the specified
    // field matches the specified value
      const querySnapshot = await admin.firestore()
        .collection(collectionPath)
        .where(fieldName, "==", value)
        .get();

      // If any documents are returned, the value exists in the field
      if (!querySnapshot.empty) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      console.error("Error checking field value: ", error);
      throw new functions.https.HttpsError(
        "internal",
        "An error occurred while checking field value.");
    }
  }
);
