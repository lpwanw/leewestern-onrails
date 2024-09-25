import React from "react"
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Layout from "@pages/Layout"
import Home from "@pages/Home"
import Craft from "@pages/Craft"
import Career from "@pages/Career"

export default (
  <Router basename={"/app"}>
    <Routes>
      <Route path="/" element={<Layout/>}>
        <Route index element={<Home/>} />
        <Route path="/craft">
          <Route index element={<Craft/>}/>
        </Route>
        <Route path="/career" element={<Career/>} />
        <Route path="*" element={<div>NotFund</div>} />
      </Route>
    </Routes>
  </Router>
)
