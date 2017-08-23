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

namespace ProdavnicaAutoDelova
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnUnosAutoDela_Click(object sender, RoutedEventArgs e)
        {
            FrmUnosAutoDela frmUnosAutoDela = new FrmUnosAutoDela();
            frmUnosAutoDela.ShowDialog();
        }

        private void btnUnosKolicine_Click(object sender, RoutedEventArgs e)
        {
            FrmDodavanjeAutoDelaUMagacin frmDodajAutoDeo = new FrmDodavanjeAutoDelaUMagacin();
            frmDodajAutoDeo.ShowDialog();
        }

        private void btnIzmenaDobavljaca_Click(object sender, RoutedEventArgs e)
        {
            FrmIzmenaDobavljaca frmIzmeniDobavljaca = new FrmIzmenaDobavljaca();
            frmIzmeniDobavljaca.ShowDialog();
        }

        private void btnBrisanjeDobavljaca_Click(object sender, RoutedEventArgs e)
        {
            FrmBrisanjeDobavljaca frmIzbrisiDobavljaca = new FrmBrisanjeDobavljaca();
            frmIzbrisiDobavljaca.ShowDialog();
        }

        private void btnTraziAutoDeo_Click(object sender, RoutedEventArgs e)
        {
            FrmTraziAuto frmTraziAutoDeo = new FrmTraziAuto();
            frmTraziAutoDeo.ShowDialog();
        }
    }
}
