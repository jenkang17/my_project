import React, { useEffect, useState } from 'react';
import './Payment.css';
import CheckoutProduct from './CheckoutProduct';
import { Link, useHistory } from "react-router-dom";
import { useStateValue } from './StateProvider';
import { CardElement, useElements, useStripe } from '@stripe/react-stripe-js';
import { getBasketTotal } from './Reducer';
import CurrencyFormat  from 'react-currency-format';
import axios from "./axios";
import { db } from './firebase';

function Payment() {
    const [{basket, user}, dispatch] = useStateValue();
    const history = useHistory();

    const stripe = useStripe();
    const elements = useElements();

    const [succeeded, setSucceeded] = useState(false);
    const [processing, setProcessing] = useState("");


    const [error, setError] = useState(null);
    const [disable, setDisable] = useState(true);
    const [clientSecret, setClientSecret] = useState(true);

    useEffect(()=>{
        const getClientSecret = async () => {
            const res = await axios({
                method: 'post',
                url: "/payments/create?total=" + getBasketTotal(basket) * 100
            });
            setClientSecret(res.data.clientSecret)
        }

        getClientSecret(); // 실행을 시켜야 getClientSecret을 가져올 수 있음
    }, [basket]) // [basket] 장바구니 내용이 바뀔 때 마다 getClientSecret(); 실행

    //console.log('client 비밀은 다음과 같아요', clientSecret);

    const handleSubmit = async (event) => { // async => 비동기 신텍스 (await과 세트)

        event.preventDefault(); // 새로고침 방지
        setProcessing(true);
        
        const payload = await stripe.confirmCardPayment(clientSecret, {
            payment_method: {
                card: elements.getElement(CardElement)
            }
        }).then(({paymentIntent}) => {
            // paymentIntent = payment 확인 및 정보

            db
                .collection('users')
                .doc(user?.uid)
                .collection('orders')
                .doc(paymentIntent.id)
                .set({
                    basket: basket,
                    amount: paymentIntent.amount,
                    created: paymentIntent.created

                })
            
            // BUTTON 초기화
            setSucceeded(true);
            setError(null)
            setProcessing(false)

            // 딜레이가 생겻을때 버튼이 비활성화 된다. 하지만 너무 빨리 넘어가서 확인이 불가능

            dispatch({
                type: 'EMPTY_BASKET'
            })


            history.replace('/orders')

        })

    }


    const handleChange = (event) => {
        setDisable(event.empty);
        setError(event.error ? event.error.message: "");
    }


    return (
        <div className='payment'>

            <div className='payment_container'>

                <h1>
                    <Link to="/checkout">
                        장바구니로 돌아가기
                    </Link>
                    ({basket?.length}개의 상품목록이 존재합니다.)
                </h1>

                <div className='payment_section'>
                    <div className='payment_title'>
                        <h3>배달 받을 곳</h3>
                    </div>
                    <div className='payment_address'>
                        <p>{user?.email} 님의 주소</p>
                        <p>서울</p>
                        <p>강남구</p>
                    </div>
                </div>
            </div>

            <div className='payment_section'>
                <div className='payment_title'>
                    <h3>상품 목록</h3>
                </div>

                <div className='payment_items'>
                    {basket.map(item => (
                        <CheckoutProduct id={item.id} title={item.title} image={item.image} 
                        price={item.price} rating={item.rating} />
                    ))}
                </div>
            </div>

            <div className='payment_section'>
                <div className='payment_title'>
                    <h3>결제</h3>
                </div>

                <div className='pament_detail'>
                    <form onSubmit={handleSubmit}>
                        <div className='payment_priceContainer'>

                            <CardElement onChange={handleChange} />

                            <CurrencyFormat 
                                renderText={ (value) => (
                                    <>
                                    <p>

                                        총액 ( {basket.length} items ) : <strong>{value}원</strong>

                                    </p>
                                        <small className="subtotal_gift">
                                            <input type="checkbox" /> 체크박스 입니다
                                        </small>
                                    </>
                                )}

                                decimalScale={2}
                                value={getBasketTotal(basket)}
                                displayType={"text"}
                                thousandSeparator={true}
                                prefix={"₩"}
                            />

                            <button disabled={processing || disable || succeeded}><span>{processing ? <p>결제중입니다.</p> : "결제하기"}</span></button>

                        </div>
                        
                        {error && <div>{error}</div>}

                    </form>
                </div>
            </div>
        </div>
    );
}

export default Payment;