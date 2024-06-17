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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            //DataGrid.ItemsSource = ABQBA.db.Users.ToList();
            //MessageBox.Show("aboba" + " " + ABQBA.db.Users.FirstOrDefault().name);

        }

        private void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTextBox.Text;
            string password = PasswordTextBox.Password;

            if (login.Length == 0 || password.Length == 0)
            {
                MessageBox.Show("Поля не могут быть пустыми");
                return;
            }

            // Поиск пользователя по логину и паролю
            var idUserFromLogins = ABQBA.db.Logins_passwords.Where(lp => lp.login == login && lp.password == password).ToList();
            //List<Logins_passwords> idUserFromLogins = (from lp in ABQBA.db.Logins_passwords where lp.login == login && lp.password == password select lp).ToList();

            if (idUserFromLogins.Count != 0)
            {
                EnterLabel.Content = ($"Здравствуйте, {idUserFromLogins[0].User.Role.role1}!!!");
                if (idUserFromLogins[0].User.Role.role1 == "admin")
                {
                    PrevAdminWindow prevAdmin = new PrevAdminWindow();
                    prevAdmin.Show();
                    this.Close();
                } else if (idUserFromLogins[0].User.Role.role1 == "user")
                {

                }
            }
            else
            {
            MessageBox.Show("Неправильно введены данные");
            }
        }
    }

    public static class ABQBA
    {
        public static abobaEntities5 db = new abobaEntities5();
    }
}
