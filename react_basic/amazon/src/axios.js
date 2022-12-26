import axios from "axios"; // Api 비동기 통신 라이브러리. 서버와의 통신을 유용하게 해줌. 

const instance = axios.create({
    baseUrl: "..."
});

export default instance;