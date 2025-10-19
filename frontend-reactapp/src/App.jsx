import React from "react";
import { BrowserRouter } from "react-router-dom";
import Navbar from "./components/NavBar";

function App() {
  return (
    <div>
      <BrowserRouter>
        <Navbar/>
      </BrowserRouter>
    </div>
  );
}

export default App;
