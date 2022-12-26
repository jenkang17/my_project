export const initialState = {
    basket: []
};

export const getBasketTotal = (basket) =>
    basket?.reduce((amount, item) => item.price + amount, 0) 
    // amount 초기값이자 앞으로 축적될 값들이 저장될 인수
    // item 현재의 아이템의 속성이 들어가는데 item.price 장바구니 아이템의 가격
    // reduce 배열 모든 값을 합산할 때 사용
    // basket 배열에서 item의 price를 합산하기 위해 reduce 사용
    // 0 <- 처음값
    // 1000 + (item.price1, item.price2, item.price3)
    // baket [2323, 33, 22] 
    // 첫번째 콜백 0(amount) + 2323(item.price1)
    // 두번째 콜백 2323(amount) + 33(item.price2)
    // 세번째 콜백 2356(amount) + 22(item.price3)
    // 마지막 콜백 2378

const reducer = (state, action) => {

    switch (action.type) {
        case 'ADD_TO_BASKET':
            return {
                ...state,
                basket: [...state.basket, action.item],
            };

        default:
            return state;

    };
};

export default reducer;