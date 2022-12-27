// *** 공백이 많으면 에러 발생 ***
const functions = require("firebase-functions");
// require node에서 사용됨. 외부에서 파일을 가져올 수 있음
const express = require("express");
// cors => 도메인 이름이 서로 다른 사이트간에 api를 요청할 때 허락된 사이트만 정보를 주고 받을 수 있게 해줌.
const cors = require("cors");
const stripe = require("stripe")(
    "sk_test_51MJCULHuh8RhhfNGRkkjhwWryZkcaS7SdrMmbNFsGcpQ5fNmZVjtYVjWZy6NjmfXwkgroFmrXdcT4SkrioCx1Dze00rhmhPgZs"
);

const app = express();

app.use(cors({origin: true}));
app.use(express.json()); // json 방식으로 정보를 주고 받겠다

// 라우트 부분
// app.get("/", (req, res) => res.status(200).send("안녕"));
app.get("/react", (req, res) => res.status(200).send("리액트"));

// END POINT
app.post("/payments/create", async (req, res) => {
    const total = req.query.total;
    //const total = req.query => ex) a.com/create?key=

    console.log("payment에서 가져온 total 곱하기 100의 양은 이것입니다." + total);

    const paymentIntent = await stripe.paymentIntents.create({
        amount: total,
        currency: "usd", // 화폐단위는 달러가 아니면 오류 생김
    });

    res.status(201).send({
        clientSecret: paymentIntent.client_secret,
    });
});

exports.api = functions.https.onRequest(app);

/*
    http://127.0.0.1:5001/clone-6ab7f/us-central1/api
*/
