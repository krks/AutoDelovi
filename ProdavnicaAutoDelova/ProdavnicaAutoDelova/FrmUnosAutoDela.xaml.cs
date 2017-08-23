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
    /// Interaction logic for FrmUnosAutoDela.xaml
    /// </summary>
    public partial class FrmUnosAutoDela : Window
    {
        public FrmUnosAutoDela()
        {
            InitializeComponent();
        }
        ProdavnicaAutoDelovaDataContext db = new ProdavnicaAutoDelovaDataContext();

        private void btnProvera_Click(object sender, RoutedEventArgs e)
        {
            int sifra = Int32.Parse(tbSifraAutoDela.Text); ;
            
            try
            {
                AutoDeo ad = db.AutoDeos.Single(a => a.sifraAutoDela == sifra);

                MessageBox.Show("Auto deo vec postoji u bazi",
                    "Obavestenje o postojanju auto dela",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception)
            {
                tbSifraDobavljaca.IsEnabled = true;
                btnOdustani.IsEnabled = true;
            }
            
        }


        private void UpisUTextBox(object sender, TextCompositionEventArgs e)
        {
            if (tbSifraDobavljaca.Text != null && tbCena.Text != null && tbOpis.Text != null)
            {
                btnPotvrdi.IsEnabled = true;
            }
        }

        private void btnOdustani_Click(object sender, RoutedEventArgs e)
        {
            VratiNaPocetnu();
        }

        private void btnPotvrdi_Click(object sender, RoutedEventArgs e)
        {
            int sifra = 0;
            Int32.TryParse(tbSifraAutoDela.Text, out sifra);

            AutoDeo ad = new AutoDeo
            {
                sifraAutoDela = Int32.Parse(tbSifraAutoDela.Text),
                Cena = Int32.Parse(tbCena.Text),
                Opis = tbOpis.Text,
                sifraDobavljaca = Int32.Parse(tbSifraDobavljaca.Text)
            };

            try
            {
                db.AutoDeos.InsertOnSubmit(ad);
                db.SubmitChanges();

                MessageBox.Show("Auto deo je uspesno upisan u bazu",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Auto deo ne moze da se upise u bazu",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }

            VratiNaPocetnu();
        }

        //Dozvoljava samo unos brojeva u textbox
        private void tbSifraAutoDela_PreviewTextInput(object sender, TextCompositionEventArgs e)
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

