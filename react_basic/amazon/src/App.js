import Header from './Header';
import Home from './Home';
import Checkout from './Checkout';
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

function App() {
  return (
    <Router>
      <div className="App">

        <Switch>

          <Route exact path="/">
            <Header/>
            <Home/>
          </Route>

          <Route exact path="/checkout">
            <Header/>
            <Checkout/>
          </Route>

        </Switch>

      </div>
    </Router>
  );
}

export default App;
