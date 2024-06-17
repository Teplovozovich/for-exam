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
    /// Логика взаимодействия для EditUserWindow.xaml
    /// </summary>
    public partial class EditUserWindow : Window
    {
        private User _currentUser = new User();
        public EditUserWindow(User selectedUser)
        {
            var user = ABQBA.db.Users.ToList();
            InitializeComponent();
            if (selectedUser != null)
                _currentUser = selectedUser;

            DataContext = _currentUser;
            ComboBoxEditStatus.ItemsSource = ABQBA.db.Users.Select(u => u.status.ToString()).Distinct().ToList();

            // Настройка ComboBoxEditRole
            var roles = ABQBA.db.Roles.Select(r => new { id_role = r.id_role, role1 = r.role1 }).ToList();
            //ABQBA.db.Roles.ToList();
            ComboBoxEditRole.ItemsSource = roles;
            ComboBoxEditRole.DisplayMemberPath = "role1"; // Отображение имени роли
            ComboBoxEditRole.SelectedValuePath = "id_role"; // Сохранение ID роли

            Binding binding = new Binding("id_role");
            binding.Source = _currentUser;
            binding.Mode = BindingMode.TwoWay; // Two-way binding
            ComboBoxEditRole.SetBinding(ComboBox.SelectedValueProperty, binding);
        }

        private void ComboEditStatus_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentUser.name))
            {
                errors.AppendLine("укажите имя");
            }
            if (_currentUser.status == null)
            {
                errors.AppendLine("укажите стату");
            }
            if (_currentUser.id_role == 0 || _currentUser.id_role > 3)
            {
                errors.AppendLine("укажите роль");
            }

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentUser.id_user == 0)
                ABQBA.db.Users.Add(_currentUser);

            try
            {
                ABQBA.db.SaveChanges();
                MessageBox.Show("Сохранено");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            Admin admin = new Admin();
            this.Close();
            admin.Show();
        }
    }
}
