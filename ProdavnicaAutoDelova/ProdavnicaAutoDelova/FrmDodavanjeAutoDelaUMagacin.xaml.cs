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
    /// Interaction logic for FrmDodavanjeAutoDelaUMagacin.xaml
    /// </summary>
    public partial class FrmDodavanjeAutoDelaUMagacin : Window
    {
        public FrmDodavanjeAutoDelaUMagacin()
        {
            InitializeComponent();
        }
        ProdavnicaAutoDelovaDataContext db = new ProdavnicaAutoDelovaDataContext();

        private void btnProvera_Click(object sender, RoutedEventArgs e)
        {
            int sifra = Int32.Parse(tbSifraAutoDela.Text);

            try
            {
                AutoDeo ad = db.AutoDeos.Single(a => a.sifraAutoDela == sifra);

                tbKolicina.IsEnabled = true;
                btnOdustani.IsEnabled = true;
                
            }
            catch (Exception)
            {
                MessageBox.Show("Auto deo ne postoji u bazi",
                    "Obavestenje o postojanju auto dela",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnOdustani_Click(object sender, RoutedEventArgs e)
        {
            VratiNaPocetnu();
        }

        private void btnPotvrdi_Click(object sender, RoutedEventArgs e)
        {
            
            try
            {
                Magacin m = db.Magacins.SingleOrDefault(x => x.SifraAutoDela == Int32.Parse(tbSifraAutoDela.Text));
                m.Kolicina += Int32.Parse(tbKolicina.Text);
                try
                {
                    db.SubmitChanges();

                    MessageBox.Show("Kolicina je uspesno uneta u bazu",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception)
                {
                    MessageBox.Show("Kolicina nije uspesno uneta u bazu",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                }
                
            }
            catch (Exception)
            {

                Magacin ma = new Magacin();
                ma.SifraAutoDela = Int32.Parse(tbSifraAutoDela.Text);
                ma.Kolicina = Int32.Parse(tbKolicina.Text);
                

                try
                {
                    db.Magacins.InsertOnSubmit(ma);
                    db.SubmitChanges();

                    MessageBox.Show("Kolicina je uspesno uneta u bazu",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception)
                {
                    MessageBox.Show("Kolicina nije uspesno uneta u bazu",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                }
                
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
