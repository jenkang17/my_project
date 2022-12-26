// 데이터 베이스 구축
import firebase from "firebase";

// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: 'AIzaSyCIjzTF74fDHVvCnGRhOocJwo6AXU8A2tM',
    authDomain: 'clone-6ab7f.firebaseapp.com',
    projectId: 'clone-6ab7f',
    storageBucket: 'clone-6ab7f.appspot.com',
    messagingSenderId: '954441131213',
    appId: '1:954441131213:web:852c0160d4bdcfdaee3584',
    measurementId: 'G-S6H1NZMMJ8',
};

const firebaseApp = firebase.initializeApp(firebaseConfig);
const db = firebaseApp.firestore();
const auth = firebase.auth();

export {db , auth };
