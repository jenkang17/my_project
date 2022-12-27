import React from 'react';
import './Header.css';
import SearchIcon from '@mui/icons-material/Search';
import ShoppingBasketIcon from '@mui/icons-material/ShoppingBasket';
import {Link} from "react-router-dom";
import {useStateValue} from "./StateProvider";
import { auth } from './firebase';

function Header(){
    const [{basket, user}] = useStateValue();

    const handleAuthentication = () => {
        if(user)
        {
            // firebase 내장함수 signOut();
            auth.signOut();
        }
    }

    return (
        <div className="header">
            <Link to="/">
                <img
                    className="header_logo"
                    src="https://pngimg.com/uploads/amazon/amazon_PNG11.png"
                    alt=""
                />
            </Link>

            <div className='header_search'>
                <input type='text' className='header_searchInput' placeholder='Search' />
                <SearchIcon className='header_searchIcon'/>
            </div>

            <div className='header_nav'>
        
                <div className='header_option'>
                    <span className='header_optionLineOne'>{!user? "게스트" : user.email}</span>
                    <Link to={!user && '/Login'} className='homelogin'> {/* {!user && '/Login'} if문과 같음 */}
                        <span className='header_optionLineTwo' onClick={handleAuthentication} >
                            {user ? '로그아웃' : '로그인'} {/* if문과 같음 : => else */}
                        </span>
                    </Link>
                </div>
                <div className='header_option'>
                    <span className='header_optionLineOne'>돌아가기</span>
                    <Link to="/orders" className='orderlist'>
                        <span className='header_optionLineTwo'>주문내역</span>
                    </Link>
                </div>
                <div className='header_option'>
                <span className='header_optionLineOne'>반가워요</span>
                    <span className='header_optionLineTwo'>좋아요</span>
                </div>

                <Link to="/Checkout">
                    <div className='header_optionBasket'>
                        <ShoppingBasketIcon/>
                        <span className='header_optionLineTowheader_basketCount'>
                            {basket?.length}
                        </span>
                    </div>
                </Link>

            </div>
        </div>
    );
}

export default Header;