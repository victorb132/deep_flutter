import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();
const db = admin.firestore();

export const newFan = functions.firestore.document('users/{userId}').onWrite(countFan);

async function countFan(change: any, context: any) {
  const oldValue = change.before.exists ? change.before.data() : null;
  const newValue = change.aftes.exists ? change.after.data() : null;

  if(oldValue != null && oldValue.team_id == newValue.team_id) {
    return null;
  }

  var batch = db.batch();

  var newTeamRef = db.doc(`teams/${newValue.team_id}`);
  batch.set(newTeamRef, {fans: admin.firestore.FieldValue.increment(1)}, {merge: true});

  if(oldValue != null) {
    var oldTeamRef = db.doc(`teams/${oldValue.team_id}`);
    batch.set(oldTeamRef, {fans: admin.firestore.FieldValue.increment(-1)}, {merge: true});
  }

  return await batch.commit();
}