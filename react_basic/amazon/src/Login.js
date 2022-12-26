import React, { useState } from 'react';
import './Login.css';
import { Link, useHistory } from 'react-router-dom';
import { auth } from './firebase';

function Login() {

    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const history = useHistory();

    // 로그인
    const signIn = e => {
        e.preventDefault(); // 새로고침 방지
        auth
            .signInWithEmailAndPassword(email, password)
            .then(auth => {
                history.push("/")
            })
            .catsh(error => alert(error.message()))
        }

    // 회원가입
    const register = e => {
        e.preventDefault(); // 새로고침 방지

        // firebase 연동
        auth.createUserWithEmailAndPassword(email, password)
            .then((auth) => {
                //console.log(auth);

                if (auth){
                    history.push('/')
                }
            })
            .catch(error => alert(error.message()))
        
    }

    return (
        <div className="login">
            <Link to="/">
                <img
                    className="login_logo"
                    src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2880px-Amazon_logo.svg.png"
                    alt=""
                />
            </Link>

            <div className="login_container">
                <h1>로그인</h1>
                <form>
                    <h5>이메일</h5>
                    <input type="text" value={email} onChange={e => setEmail(e.target.value)} />
                    <h5>비밀번호</h5>
                    <input type="password" value={password} onChange={e => setPassword(e.target.value)} />

                    <button className="login_signInButton" onClick={signIn} >로그인하기</button>

                </form>

                <p>이용약관에 동의하십니까?</p>
                <button className="login_registerButton" onClick={register} >회원가입</button>

            </div>
        </div>
    );
}

export default Login;
