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
  async (data) => {
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

export const checkUserExists = functions.https.onCall(
  async (data) => {
    const {collectionPath, cpf, firstName, lastName, email} = data;

    try {
      // Query the collection for documents where the email, cpf, firstName,
      // and lastName fields all match the specified values
      const querySnapshot = await admin.firestore()
        .collection(collectionPath)
        .where("cpf", "==", cpf)
        .where("firstName", "==", firstName)
        .where("lastName", "==", lastName)
        .get();
      // If any documents are returned,
      // the values all belong to the same user uid
      if (!querySnapshot.empty) {
        const uid = querySnapshot.docs[0].id;
        const user = await admin.auth().getUserByEmail(email);
        if (uid === user.uid) {
          return true;
        }
      }
      return false;
    } catch (error) {
      console.error("Error checking email: ", error);
      throw new functions.https.HttpsError(
        "internal",
        "An error occurred while checking user.");
    }
  }
);
