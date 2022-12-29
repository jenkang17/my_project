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

    constructor() {
        super();

        this.state = {
            searchKeyword : "",
            searchResult : [],
            submitted : false,
            selectedTab : TabType.KEYWORD,
            keywordList: [],
            historyList:[],
        }
    }

    componentDidMount() {
        const keywordList = store.getKeywordList();
        const historyList = store.getHistoryList();

        this.setState({
            keywordList,
            historyList,
        })
    }

    handleChangeInput(event) {
        const searchKeyword = event.target.value;
        
        this.setState({ searchKeyword });
    }

    handleReset() {
        this.setState( () => {
            return {
                searchKeyword: "",
                submitted: false,
            };
        }, () => {
            console.log( this.state.searchKeyword );
        });
    }

    handleSubmit(event) {
        event.preventDefault();
        this.search(this.state.searchKeyword);
    }

    search(searchKeyword) {
        const searchResult = store.search(searchKeyword);
        const historyList = store.getHistoryList();
        
        this.setState({
            searchKeyword,
            searchResult,
            submitted: true,
            historyList,
        });

        console.log(historyList);
    }

    handleClickRemoveHistory(event, keyword) {
        event.stopPropagation(); // 버튼 안에서만 클릭 이벤트 발생하게
        store.removeHistory(keyword);
        const historyList = store.getHistoryList();
        this.setState({ historyList }); 
        
    }


    render() {

        let resetButton = null;

        if ( this.state.searchKeyword.length > 0 )
        {
            resetButton = <button type='reset' className='btn-reset'></button>;
        }

        const searchForm = (
            <form
                onSubmit={ (event) => this.handleSubmit(event) }
                onReset={ () => this.handleReset() }
            >
                <input
                    type="text"
                    placeholder="검색어를 입력하세요."
                    autoFocus
                    value={ this.state.searchKeyword }
                    onChange={ (event) => this.handleChangeInput(event) }
                />

                { resetButton }
            </form>
        );

        const searchResult = (
            this.state.searchResult.length > 0 ? (
                <ul className="result">
                    {this.state.searchResult.map( (item) => {
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
        );

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
        
        
            const hisrotyList = (
                this.state.searchResult.length > 0 ? (
                <ul className="list">
                    {this.state.historyList.map(({id, keyword, date}) => {
                        return (
                            <li
                                key={id}
                                onClick={ () => this.search(keyword)}
                            >
                                <span>{keyword}</span>
                                <span className="date">{formatRelativeDate(date)}</span>
                                <button className="btn-remove" onClick={(event) => this.handleClickRemoveHistory(event, keyword)}></button>
                            </li>
                        );
                    })}
                </ul>
                ): (
                    <div className="empty-box">최근 검색어가 없습니다.</div>
                )
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

                { this.state.selectedTab === TabType.KEYWORD && keywordList}
                { this.state.selectedTab === TabType.HISTORY && hisrotyList}
            </>
        )
        
        return (
            <>
                <header className="container">
                    <h2>검색</h2>
                </header>

                <div className="container">

                    { searchForm }

                    <div className="content">
                        { this.state.submitted ? searchResult : tabs }
                    </div>
                </div>
            </>
        );
    }
}

ReactDOM.render(<App/>, document.querySelector('#app'));