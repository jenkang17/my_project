import axios from "axios"; // Api 비동기 통신 라이브러리. 서버와의 통신을 유용하게 해줌. 

const instance = axios.create({
    baseURL: "http://127.0.0.1:5001/clone-6ab7f/us-central1/api" //  여기에 클라우드 function 에서 가져온 API URL을 적으면 된다.
});

export default instance;