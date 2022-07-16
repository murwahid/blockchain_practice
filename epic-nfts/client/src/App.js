import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      {/* NAVIGATION */}
      <div class="navigation">
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
          <a class="navbar-brand" href="#">Moose NFT</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
              <a class="nav-item nav-link" href="#">Discover</a>
              <a class="nav-item nav-link" href="#">Stats</a>
              <a class="nav-item nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Resources</a>
            </div>
          </div>
        </nav>
      </div>
    </div >
  );
}

export default App;
