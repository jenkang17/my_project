import React from 'react';
import './Header.css';
import SearchIcon from '@mui/icons-material/Search';
import ShoppingBasketIcon from '@mui/icons-material/ShoppingBasket';
import {Link} from "react-router-dom";

function Header(){
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
                    <span className='header_optionLineOne'>안녕하세요!</span>
                    <span className='header_optionLineTwo'>로그인하기</span>
                </div>
                <div className='header_option'>
                    <span className='header_optionLineOne'>돌아가기</span>
                    <span className='header_optionLineTwo'>주문내역</span>
                </div>
                <div className='header_option'>
                <span className='header_optionLineOne'>반가워요</span>
                    <span className='header_optionLineTwo'>좋아요</span>
                </div>
                
                <div className='header_optionBasket'>
                    <ShoppingBasketIcon/>
                    <span className='header_optionLineTowheader_basketCount'>0</span>
                </div>

            </div>
        </div>
    );
}

export default Header;