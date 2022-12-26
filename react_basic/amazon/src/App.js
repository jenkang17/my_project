import Header from './Header';
import Home from './Home';
import Checkout from './Checkout';
import Login from './Login';
import Payment from './Payment';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import { useEffect } from 'react';
import { auth } from './firebase';
import { useStateValue } from './StateProvider';
import { loadStripe } from '@stripe/stripe-js/pure';
import {Elements} from "@stripe/react-stripe-js";

const promize = loadStripe (
    "pk_test_51MJCULHuh8RhhfNGhqI6Gy1L6clMPGp5rfoVzDCdUxbwTpgjP9r7WgHLK8jPseMoCqY8wHzEnk19t47lwSET9ydh00zq7Hbaib"
)

function App() {

    const [{}, dispatch] = useStateValue();


    // 로그인 상태에 대해 동기화 해주는 함수
    useEffect( () => {
        auth.onAuthStateChanged(authUser => {
            //console.log(authUser);
            if(authUser)
            {
                dispatch({
                    type: 'SET_USER',
                    user: authUser
                })
            }
            else
            {
                dispatch({
                    type:'SET_USER',
                    user: null
                })
            }
        })
    }, [])

    return (
        <Router>
            <div className="App">
                <Switch>

                    <Route path="/login">
                        <Login />
                    </Route>

                    <Route exact path="/">
                        <Header />
                        <Home />
                    </Route>

                    <Route exact path="/checkout">
                        <Header />
                        <Checkout />
                    </Route>

                    <Route path="/payment">
                        <Header/>
                        <Elements stripe={promize}>
                            <Payment/>
                        </Elements>
                    </Route>

                </Switch>
            </div>
        </Router>
    );
}

export default App;
