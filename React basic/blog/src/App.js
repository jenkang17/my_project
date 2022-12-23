/* eslint-disable */ //warning message 안보이게 처리

import logo from './logo.svg';
import './App.css';
import { useState } from 'react';

function App() {
    let logo = 'React Logo';
    let [title, title_edit] = useState([
        '코딩 맛집',
        '강남 코딩 추천',
        '경기도 코딩 추천',
    ]);
    let [like, like_edit] = useState(0); //STATE 변경 함수

    // function like_cnt(){
    //   console.log(1);
    // }

    // let [title1, t1] =useState(['코딩 맛집']);
    // let [title2, t2] = useState('강남 코딩 추천');
    // let [title3, t3] = useState('경기도 코딩 추천'); //STATE : 자동 재랜더링. 자주 변경되는 것을 담아둔다

    let num = [1, 2, 3];
    //let e = num[0];
    //let f = num[1];
    //let g = num[2];
    let [e, f, g] = [1, 2, 3];

    return (
        <div className="App">
            <div className="black-nav">
                <h4 style={{ fontSize: '20px' }}>{logo}</h4>
            </div>

            <button
                onClick={() => {
                    let copy = [...title];
                    copy[0] = '코딩 맛없집';
                    title_edit(copy);
                }}
            >
                글수정
            </button>
            {/* <button onClick={ ()=>{ title_edit([ '코딩 맛없집', '강북 코딩 추천' , '부산 코딩 추천']) } }>글 수정</button> */}

            <button
                onClick={() => {
                    let copyArray = [...title];
                    copyArray = copyArray.sort();
                    title_edit(copyArray);
                }}
            >
                글정렬
            </button>

            <div className="list">
                <h4 style={{ color: '#666', fontSize: '16px' }}>
                    {title[0]}{' '}
                    <span
                        onClick={() => {
                            like_edit(like + 1);
                        }}
                    >
                        👍
                    </span>{' '}
                    {like}{' '}
                </h4>
                {/* <h4 style={ { color: '#666', fontSize: '16px' } }>{ title[0] } <span onClick={ like_cnt }>👍</span> { like } </h4> */}
                <p>2월 17일 발행 {g}</p>
            </div>
            <div className="list">
                <h4 style={{ color: '#666', fontSize: '16px' }}>{title[1]}</h4>
                <p>2월 17일 발행 {f}</p>
            </div>
            <div className="list">
                <h4 style={{ color: '#666', fontSize: '16px' }}>{title[2]}</h4>
                <p>2월 17일 발행 {e}</p>
            </div>

            <Modal></Modal>
        </div>
    );
}


    let Modal = () => {
        return (
            <div className='modal'>
                <h4>제목</h4>
                <p>일자</p>
                <p>상세내용</p>
            </div>
        );
    }
// function Modal() {
//     // 함수명 : 첫 알파벳 대문자
//     return (
//         <div className="modal">
//             <h4>제목</h4>
//             <p>날짜</p>
//             <p>상세내용</p>
//         </div>
//     );
// }

export default App;
