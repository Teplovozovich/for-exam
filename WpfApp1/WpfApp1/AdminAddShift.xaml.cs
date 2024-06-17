using System;
using System.Collections.Generic;
using System.Globalization;
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
    /// Interaction logic for AdminAddShift.xaml
    /// </summary>
    public partial class AdminAddShift : Window
    {
        private Shift _currentShift = new Shift();
        public AdminAddShift()
        {
            InitializeComponent();
            DataContext = _currentShift;

            var users = ABQBA.db.Users.Select(r => new { id_user = r.id_user, name = r.name }).ToList();
            //ABQBA.db.Roles.ToList();
            ComboBoxSetName.ItemsSource = users;
            ComboBoxSetName.DisplayMemberPath = "name"; // Отображение имени роли
            ComboBoxSetName.SelectedValuePath = "id_user"; // Сохранение ID роли

            Binding binding = new Binding("id_user");
            binding.Source = _currentShift;
            binding.Mode = BindingMode.TwoWay; // Two-way binding
            ComboBoxSetName.SetBinding(ComboBox.SelectedValueProperty, binding);
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            AdminShifts admin = new AdminShifts();
            admin.Show();
            this.Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            string dateFormat = "dd.MM.yyyy";
            DateTime parsedDate;

            if (DateTime.TryParseExact(TextSetData.Text, dateFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out parsedDate))
            {
                ABQBA.db.Shifts.Add(_currentShift);
                ABQBA.db.SaveChanges();
                MessageBox.Show("Все гуд");
            }
            else
            {
                MessageBox.Show("Неправильный ввод даты");
            }
        }
    }
}
