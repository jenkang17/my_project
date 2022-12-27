// Reducer 초기상태 설정 후 앱 전역에 보내줌

export const initialState = {
    basket: [],
    user: null
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

    //console.log(action);

    switch (action.type) {
        case 'ADD_TO_BASKET':
            return {
                ...state, // ... => 스프레드 신텍스. [] 안에 내용만 가져옴
                basket: [...state.basket, action.item],
            };
        
        case 'EMPTY_BASKET':
            return {
                ...state,
                basket: []
            }

        case 'REMOVE_FROM_BASKET':

            //console.log(state);
            //console.log(action);

            const index = state.basket.findIndex(
                (basketItem) => basketItem.id === action.id
            );

            let newBasket = [...state.basket];

            console.log(index);
            console.log(newBasket);

            if(index >= 0)
            {
                newBasket.splice(index, 1); // slice 제거를 시작할 인덱스, 몇개를 제거할 것인가 
            }
            else
            {
                console.warn(
                    ' (id: ' +
                    action.id +
                    ')이 장바구니에 존재하지 않습니다 '
                )
            }

            return {
                ...state,
                basket: newBasket
            }

        
        case 'SET_USER':
            return {
                ...state,
                user: action.user
            }

        default:
            return state;

    };
};

export default reducer;