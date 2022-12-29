import { createNextId } from './helpers.js';
import storage from './storage.js';

const tag = "[store]";
console.log(tag);

class Store {
  constructor(storage) {
    console.log(tag, "constructor");

    if (!storage) throw "no storage";

    this.storage = storage;
  }

  search(keyword) {
    this.addHistory(keyword);
    return this.searchResult = this.storage.productData.filter((product) =>
      product.name.includes(keyword)
    );
  }

  addHistory( keyword = "") {
    keyword=  keyword.trim();
    if(!keyword){
      return;
    }

    const hasHistory = this.storage.historyData.some(
      (history) => history.keyword === keyword
    );

    if (hasHistory) {
      this.removeHistory(keyword);
    }

    const id = createNextId(this.storage.historyData);
    const date = new Date();
    this.storage.historyData.push({ id, keyword, date });
    this.storage.historyData = this.storage.historyData.sort(this._sortHistory);

  }

  getKeywordList(){
    return this.storage.keywordData;
  }

  getHistoryList() {
    return this.storage.historyData.sort(this._sortHistory);
  }

  _sortHistory(hisroty1, hisroty2) {
    return hisroty2.date - hisroty1.date;
  }

  removeHistory(keyword) {
    this.storage.historyData = this.storage.historyData.filter((history) => history.keyword !== keyword)
  }
}

const store = new Store(storage);

export default store;