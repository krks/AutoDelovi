using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ProdavnicaAutoDelova
{
    /// <summary>
    /// Interaction logic for FrmIzmenaDobavljaca.xaml
    /// </summary>
    public partial class FrmIzmenaDobavljaca : Window
    {
        public FrmIzmenaDobavljaca()
        {
            InitializeComponent();
        }
        ProdavnicaAutoDelovaDataContext db = new ProdavnicaAutoDelovaDataContext();
        
        private void btnProvera_Click(object sender, RoutedEventArgs e)
        {
            int sifra = Int32.Parse(tbSifraDobavljaca.Text);

            try
            {
                Dobavljac d = db.Dobavljacs.Single(a => a.sifraDobavljaca == sifra);

                tbNazivFirme.IsEnabled = true;
                tbBrojTelefona.IsEnabled = true;
                tbAdresa.IsEnabled = true;
                btnOdustani.IsEnabled = true;
                btnPotvrdi.IsEnabled = true;

                tbNazivFirme.Text = d.nazivFirme;
                tbBrojTelefona.Text = d.brTelefona;
                tbAdresa.Text = d.adresaDobavljaca;

            }
            catch (Exception)
            {
                MessageBox.Show("Dobavljac nije pronadjen",
                    "Obavestenje o postojanju dobavljaca",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnOdustani_Click(object sender, RoutedEventArgs e)
        {
            VratiNaPocetnu();
        }

        private void btnPotvrdi_Click(object sender, RoutedEventArgs e)
        {
            Dobavljac d = db.Dobavljacs.SingleOrDefault(x => x.sifraDobavljaca == Int32.Parse(tbSifraDobavljaca.Text));

            d.nazivFirme = tbNazivFirme.Text;
            d.brTelefona = tbBrojTelefona.Text;
            d.adresaDobavljaca = tbAdresa.Text;
            
            try
            {
                db.SubmitChanges();

                MessageBox.Show("Dobavljac je uspesno izmenjen u bazi",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Dobavljac nije uspesno izmenjen u bazi",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }

            VratiNaPocetnu();
        }

        //Dozvoljava samo unos brojeva u textbox
        private void tbBrojTelefona_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        //Dozvoljava samo unos brojeva u textbox
        private void tbSifraDobavljaca_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void VratiNaPocetnu()
        {
            this.Close();
        }
    }
}
