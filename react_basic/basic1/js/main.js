import { formatRelativeDate } from './js/helpers.js';
import store from './js/store.js';

const TabType = {
    KEYWORD: 'KEYWORD',
    HISTORY: 'HISTORY',
};

const TabLabel = {
    [TabType.KEYWORD]: '추천 검색어',
    [TabType.HISTORY]: '최근 검색어',
};

class App extends React.Component {

    constructor(){ // 생성자 함수, 상태 관리, 초기값 설정
        super();

        this.state = {
            searchKeyword: "",
            searchResult: [],
            submitted: false,
            selectedTab: TabType.KEYWORD,
            keywordList: [],
            historyList: [],
        };
    }

    componentDidMount() {
        const keywordList = store.getKeywordList();
        const historyList  = store.getHistoryList();
        
        this.setState({
            keywordList,
            historyList,
        });
    }

    handleSubmit(event){
        event.preventDefault();
        //console.log('handleSubmit', this.state.searchKeyword);
        this.search(this.state.searchKeyword);   
    }

    search(searchKeyword) {
        const searchResult = store.search(searchKeyword);
        this.setState({ 
            searchKeyword,
            searchResult,
            submitted: true,
        });
    }

    handleReset(){
        //this.setState({ searchKeyword: "" });
        //console.log('handleReset', this.state.searchKeyword);

        this.setState(() => { // setState가 실행된 후에 콘솔을 찍음. 이유는 setState는 비동기 방식이라 UI상에서는 사라지지만 콘솔엔 남아있기 때문.
            return { 
                searchKeyword: "", 
                submitted: false,
            };
        }, () => {
            console.log('handleReset', this.state.searchKeyword);
        })
    }

    handleChangeInput(event) {
        //this.state.searchKeyword = event.target.value;
        //this.forceUpdate(); // 상태 갱신 이벤트 발생시 render() 실행

        const searchKeyword = event.target.value;

        if (searchKeyword.length <= 0 && this.state.submitted) {
            return this.handleReset();
        }

        this.setState({ searchKeyword });
    }

    handleClickRemoveHistory(event, keyword) {
        event.stopPropagation(); // 버튼 안에서만 클릭 이벤트 발생하게 
        
        store.removeHistory(keyword)
        const historyList = store.getHistoryList();
        this.setState({ historyList });
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
            { resetButton }
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

        const keywordList = (
            <ul className="list">
                {this.state.keywordList.map((item, index) => {
                    return (
                        <li 
                        key={item.id}
                        onClick={ () => this.search(item.keyword)}
                        >
                            <span className="number">{index + 1}</span>
                            <span>{item.keyword}</span>
                        </li>
                    );
                })}
            </ul>
        );

        const historyList = (
            <ul className="list">
                {this.state.historyList.map(({id, keyword, date}) => {
                    return (
                        <li
                        key={id}
                        onClick={ () => this.search(keyword)}
                        >
                            <span>{ keyword }</span>
                            <span className="date">{ formatRelativeDate(date) }</span>
                            <button className="btn-remove" onClick={event => this.handleClickRemoveHistory(event, keyword)}></button>
                        </li>
                    )
                })}
            </ul>
        )

        const tabs = (
            <>
            <ul className="tabs">
                {Object.values(TabType).map((tabType) => {
                    return <li 
                    className={this.state.selectedTab === tabType ? "active" : ""} 
                    key={tabType}
                    onClick={() => this.setState({selectedTab: tabType})}
                    >
                        {TabLabel[tabType]}
                    </li>;
                })}
            </ul>
            {this.state.selectedTab === TabType.KEYWORD &&  keywordList}
            {this.state.selectedTab === TabType.HISTORY &&  historyList}
            </>
        );

        return (
            <>
                <header>
                    <h2 className="container">검색</h2>
                </header>
                <div className="container">
                    
                    {searchForm}

                    <div className="content">
                        {this.state.submitted ? searchResult : tabs}
                    </div>
                </div>
            </>
        );
    }
}

ReactDOM.render(<App />, document.querySelector('#app'));
