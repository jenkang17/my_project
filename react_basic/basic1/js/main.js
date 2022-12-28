import store from './js/store.js';

class App extends React.Component {

    constructor(){ // 생성자 함수
        super();

        this.state = {
            searchKeyword: "",
            searchResult: [],
            submitted: false,
        };
    }

    handleSubmit(event){
        event.preventDefault();
        //console.log('handleSubmit', this.state.searchKeyword);
        this.search(this.state.searchKeyword);   
    }

    search(searchKeyword) {
        const searchResult = store.search(searchKeyword);
        this.setState({ 
            searchResult,
            submitted: true,
        });
    }

    handleReset(){
        //this.setState({ searchKeyword: "" });
        //console.log('handleReset', this.state.searchKeyword);

        this.setState(() => { // setState가 실행된 후에 콘솔을 찍음. 이유는 setState는 비동기 방식이라 UI상에서는 사라지지만 콘솔엔 남아있기 때문.
            return { searchKeyword: "" };
        }, () => {
            console.log('handleReset', this.state.searchKeyword);
        })
    }

    handleChangeInput(event) {
        //this.state.searchKeyword = event.target.value;
        //this.forceUpdate(); // 상태 갱신 이벤트 발생시 render() 실행

        const searchKeyword = event.target.value;

        if (searchKeyword.length <= 0) {
            return this.handleReset();
        }

        this.setState({ searchKeyword });
    }
    
    render() {
        let resetButton = null;

        if (this.state.searchKeyword.length > 0) {
            resetButton = <button type="reset" className="btn-reset"></button>;
        }

        const searchForm = (
            <form 
                onSubmit={event => this.handleSubmit(event)}
                onReset={() => this.handleReset()}
            >
            <input
                type="text"
                placeholder="검색어를 입력하세요"
                autoFocus
                value={this.state.searchKeyword}
                onChange={ (event) => this.handleChangeInput(event) }
            />
            {resetButton}
            {/* {this.state.searchKeyword.length > 0 && (
                <button type="reset" className="btn-reset"></button>
            )} */}
        </form>
        )

        const searchResult = (
            this.state.searchResult.length > 0 ? (
                <ul className="result">
                    {this.state.searchResult.map(item => {
                        return (
                            <li key={item.id}>
                                <img src={item.imageUrl} alt={item.name} />
                                <p>{item.name}</p>
                            </li>
                        )
                    })}
                </ul>
            ): (
                <div className="empty-box">검색 결과가 없습니다.</div>
            )
        )

        return (
            <>
                <header>
                    <h2 className="container">검색</h2>
                </header>
                <div className="container">
                    
                    {searchForm}

                    <div className="content">
                        {this.state.submitted && searchResult}
                    </div>
                </div>
            </>
        );
    }
}

ReactDOM.render(<App />, document.querySelector('#app'));
