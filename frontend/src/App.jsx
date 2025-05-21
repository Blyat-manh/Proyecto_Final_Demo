import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Login from './components/Login';
import Dashboard from './components/Dashboard';
import EmployeeManagement from './components/EmployeeManagement'
import InventoryManagement from './components/InventoryManagement'
import PlaceOrder from './components/order/PlaceOrder'
import Menu from './components/Menu'

export const apiUrl ="https://easyservebackend-production.up.railway.app"

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/employee-management" element={<EmployeeManagement />} />
        <Route path="/inventory-management" element={<InventoryManagement />} />
        <Route path="/place-order" element={<PlaceOrder />} />
        <Route path="/menu" element={<Menu />} />
      </Routes>

    </Router>
  );
}

export default App;