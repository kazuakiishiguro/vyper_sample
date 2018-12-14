import React, { Component } from 'react';
import { setupWeb3, getBlockNumber } from './utils/web3connection';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      blockNumber: 'Loading...'
    }
  }

  componentWillMount() {
    setupWeb3();
    setInterval(async () => {
        const newBlockNumber = await getBlockNumber();
        if(newBlockNumber !== this.state.blockNumber) {
          this.setState({
            blockNumber: newBlockNumber
          })
        }
    }, 2000);
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          blockNumber : {this.state.blockNumber}
        </header>
      </div>
    );
  }
}

export default App;