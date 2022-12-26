import './Payment.css';
import { useStateValue } from './StateProvider';
import { Link, useHistory } from "react-router-dom";
import CheckoutProduct from './CheckoutProduct';
import CurrencyFormat  from 'react-currency-format';
import { getBasketTotal } from './Reducer';
import { CardElement, useElements } from '@stripe/react-stripe-js';
import { useEffect } from 'react';

function Payment() {
    const [{basket, user}, dispatch] = useStateValue();
    const history = useHistory();
    const [error, setError] = useState(null);
    const [disable, setDisable] = useState(true);
    const [processing, setProcessing] = useState("");
    const [succeded, setSucceeded] = useState(false);


    const [clientSecret, sedtClientSecret] = useState(true);


    const stripe = useState();
    const elements = useElements(true);

    useEffect(()=>{
        const getClientSecret = async () => {
            const response.await axios ({
                method: 'post',
                url:'/payment/create?total=${getBasketTotal(basket) * 100}'
            });
            setClientSecret(response.data.clientSecret)
        }

        getClientSecret();
    }, [basket]) // [basket] 장바구니 내용이 바뀔 때 마다 getClientSecret(); 실행

    const handleSubmit = async(event) => { // async => 비동기 신텍스
        event.preventDefault(); // 새로고침 방지
        setProcessing(true);
        
        const payload = await stripe.confirmCardPayment(clientSecret, {
            payment_mothod: {
                card: elements.getElement(CardElement)
            }
        }).then(({paymentIntent}) => {
            setSucceeded(true);
            setError(null);
            setProcessing("");

            history.replace('/orders')
        }

    )
        
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

                            <button disabled={processing || disable || succeded}><span>{processing ? <p>결제중입니다.</p> : "결제하기"}</span></button>

                        </div>
                        
                        {error && <div>{error}</div>}

                    </form>
                </div>
            </div>
        </div>
    );
}

export default Payment;