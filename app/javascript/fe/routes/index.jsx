import React from "react"
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Layout from "@pages/Layout"
import Home from "@pages/Home"

export default (
  <Router basename={"/app"}>
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<Home />} />
        <Route path="*" element={<div>NotFund</div>} />
      </Route>
    </Routes>
  </Router>
)
