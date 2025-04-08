import React from 'react';
import { useHistory } from 'react-router-dom';

const Dashboard = () => {
  const history = useHistory();

  const handleLogout = () => {
    localStorage.removeItem('token');
    history.push('/');
  };

  const navigateToEmployeeManagement = () => {
    history.push('/employee-management');
  };
  const navigateToInventoryManagement = () => {
    history.push('/inventory-management');
  };
  const navigateToPlaceOrder = () => {
    history.push('/place-order');
  };

  return (
    <div>
      <h1>Dashboard</h1>
      <button onClick={handleLogout}>Logout</button>
      <button onClick={navigateToEmployeeManagement}>Manage Employees</button>
      <button onClick={navigateToInventoryManagement}>Manage Inventory</button>
      <button onClick={navigateToPlaceOrder}>Place Order</button>
    </div>
  );
};

export default Dashboard;