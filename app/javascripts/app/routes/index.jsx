import React, { lazy, Suspense } from "react"
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Layout from "@pages/Layout"
import CardPageSkeleton from "@skeletons/CardPageSkeleton"
const Home = lazy(() => import("@pages/Home"))
const Craft = lazy(() => import("@pages/Craft"))
const Career = lazy(() => import("@pages/Career"))

export default (
  <Router basename={"/app"}>
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<Home />} />
        <Route path="/craft">
          <Route
            index
            element={
              <Suspense fallback={<CardPageSkeleton />}>
                <Craft />
              </Suspense>
            }
          />
        </Route>
        <Route path="/career" element={<Career />} />
        <Route path="*" element={<div>NotFund</div>} />
      </Route>
    </Routes>
  </Router>
)
