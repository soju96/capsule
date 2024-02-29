// /**
//  * Import function triggers from their respective submodules:
//  *
//  * const {onCall} = require("firebase-functions/v2/https");
//  * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
//  *
//  * See a full list of supported triggers at https://firebase.google.com/docs/functions
//  */

// const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started

// // exports.helloWorld = onRequest((request, response) => {
// //   logger.info("Hello logs!", {structuredData: true});
// //   response.send("Hello from Firebase!");
// // });

// const functions = require('firebase-functions');
// const admin = require('firebase-admin');
// const { DateTime } = require('luxon');

// admin.initializeApp();

// exports.scheduleDailyNotification = functions.pubsub.schedule('every day 18:00').onRun(async (context) => {
//     const payload = {
//         notification: {
//         title: 'Daily Reminder',
//         body: 'Remember to write your note!',
//         },
//         data: {
//         type: 'daily_reminder',
//         },
//     };

//     try {
//         const tokensSnapshot = await admin.firestore().collection('tokens').get();
//         const tokens = tokensSnapshot.docs.map(doc => doc.data().token);
        
//         const response = await admin.messaging().sendToDevice(tokens, payload);
//         console.log('Notification sent successfully:', response);
//     } catch (error) {
//         console.error('Error sending notification:', error);
//     }
//     });