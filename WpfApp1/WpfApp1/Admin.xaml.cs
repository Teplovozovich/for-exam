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
    /// Логика взаимодействия для Admin.xaml
    /// </summary>
    public partial class Admin : Window
    {
        public Admin()
        {
            InitializeComponent();
            UnpdateAdminUsers();

            var allStatuses = ABQBA.db.Users.Select(s => s.status).Distinct().ToList(); // Select distinct statuses
            allStatuses.Insert(0, "Все статусы"); // Insert a string representing all statuses

            AdminComboBox.ItemsSource = allStatuses;
            AdminComboBox.SelectedIndex = 0;

            AdminListView.ItemsSource = ABQBA.db.Users.ToList();


        }

        public void UnpdateAdminUsers()
        {
            var currentUsers = ABQBA.db.Users.ToList();

            if (AdminComboBox.SelectedIndex > 0)
            {
                currentUsers = currentUsers.Where(p => p.status.ToString() == AdminComboBox.SelectedItem.ToString()).ToList();
            }
            //currentUsers = currentUsers.Where(u => u.Role.role1.ToLower().Contains(SearchTextBox.Text.ToLower())).ToList если данные в другой таблице
            currentUsers = currentUsers.Where(u => u.name.ToLower().Contains(SearchTextBox.Text.ToLower())).ToList();

            AdminListView.ItemsSource = currentUsers;
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UnpdateAdminUsers();
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
            EditUserWindow edidPage = new EditUserWindow(null);
            edidPage.Show();
            this.Close();
        }
        
        //удаление
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var usersForRemoning = AdminListView.SelectedItems.Cast<User>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {usersForRemoning.Count()} элеметов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    ABQBA.db.Users.RemoveRange(usersForRemoning);
                    ABQBA.db.SaveChanges();
                    MessageBox.Show("Данные удалены");

                    AdminListView.ItemsSource = ABQBA.db.Users.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            PrevAdminWindow prevAdmin = new PrevAdminWindow();
            prevAdmin.Show();
            this.Close();
        }
    }
}
