import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Login from './components/Login';
import Dashboard from './components/Dashboard';

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/" exact component={Login} />
        <Route path="/dashboard" component={Dashboard} />
        <Route path="/employee-management" component={EmployeeManagement} />
        <Route path="/inventory-management" component={InventoryManagement} />
        <Route path="/place-order" component={PlaceOrder} />
      </Switch>
    </Router>
  );
}

export default App;