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
    /// Interaction logic for FrmBrisanjeDobavljaca.xaml
    /// </summary>
    public partial class FrmBrisanjeDobavljaca : Window
    {
        public FrmBrisanjeDobavljaca()
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

                btnOdustani.IsEnabled = true;
                btnPotvrdi.IsEnabled = true;

                tbNazivFirme.Text = d.nazivFirme;
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
            int sifra = Int32.Parse(tbSifraDobavljaca.Text);

            var d = db.Dobavljacs.SingleOrDefault(x => x.sifraDobavljaca == sifra);
            IQueryable<AutoDeo> a = db.AutoDeos.Where(x => x.sifraDobavljaca == d.sifraDobavljaca);
            IQueryable<StavkaRacuna> r = null;
            foreach (var ad in a)
            {
                r = db.StavkaRacunas.Where(x => x.SifraAutoDela == ad.sifraAutoDela);
            }

            try
            {
                db.Dobavljacs.DeleteOnSubmit(d);
                foreach (var ad in a)
                {
                    db.AutoDeos.DeleteOnSubmit(ad);
                }
                foreach (var sr in r)
                {
                    db.StavkaRacunas.DeleteOnSubmit(sr);
                }

                db.SubmitChanges();

                MessageBox.Show("Dobavljac je uspesno obrisan iz baze",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Information);

            }
            catch (Exception)
            {

                MessageBox.Show("Dobavljac nije uspesno izbrisan u bazi",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }

            VratiNaPocetnu();
        }

        private void VratiNaPocetnu()
        {
            this.Close();
        }

        //Dozvoljava samo unos brojeva u textbox
        private void tbSifraDobavljaca_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
    }
}
