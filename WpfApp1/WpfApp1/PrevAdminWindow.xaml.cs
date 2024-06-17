using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for PrevAdminWindow.xaml
    /// </summary>
    public partial class PrevAdminWindow : Window
    {
        public PrevAdminWindow()
        {
            InitializeComponent();
            UnpdateAdminUsers();

            AdminOrdersListView.ItemsSource = ABQBA.db.Orders.ToList();
        }

        public void UnpdateAdminUsers()
        {
            var currentUsers = ABQBA.db.Orders.ToList();

            
            //currentUsers = currentUsers.Where(u => u.Role.role1.ToLower().Contains(SearchTextBox.Text.ToLower())).ToList если данные в другой таблице
            currentUsers = currentUsers.Where(u => u.date.ToLower().Contains(SearchTextBox.Text.ToLower())).ToList();

            AdminOrdersListView.ItemsSource = currentUsers;
        }

        //редактирование
        private void BtnEditUser_Click(object sender, RoutedEventArgs e)
        {
            EditUserWindow editPage = new EditUserWindow((sender as Button).DataContext as User);
            editPage.Show();
            this.Close();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            UnpdateAdminUsers();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            AdminShifts admin = new AdminShifts();
            admin.Show();
            this.Close();
        }

        //удаление
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Admin admin = new Admin();
            admin.Show();
            this.Close();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            MainWindow main = new MainWindow();
            main.Show();
            this.Close();
        }
    }
}
