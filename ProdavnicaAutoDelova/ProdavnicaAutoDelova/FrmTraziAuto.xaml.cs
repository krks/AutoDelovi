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
    /// Interaction logic for FrmTraziAuto.xaml
    /// </summary>
    public partial class FrmTraziAuto : Window
    {
        public FrmTraziAuto()
        {
            InitializeComponent();
        }
        ProdavnicaAutoDelovaDataContext db = new ProdavnicaAutoDelovaDataContext();

        private void btnProvera_Click(object sender, RoutedEventArgs e)
        {
            int sifra = 0;
            Int32.TryParse(tbSifraAutoDela.Text,out sifra);

            if (sifra == 0)
            {
                //var autoDelovi = db.AutoDeos;

                var autoDelovi = from a in db.AutoDeos
                        join d in db.Dobavljacs on a.sifraDobavljaca equals d.sifraDobavljaca
                        join m in db.Magacins on a.sifraAutoDela equals m.SifraAutoDela
                        select new
                        {
                            a.sifraAutoDela, a.Opis, a.Cena, m.Kolicina, d.nazivFirme
                        };


                dataGrid.ItemsSource = autoDelovi;
                IzmenaTabele();
            }
            else
            {
                var autoDeo = from a in db.AutoDeos
                              join d in db.Dobavljacs on a.sifraDobavljaca equals d.sifraDobavljaca
                              join m in db.Magacins on a.sifraAutoDela equals m.SifraAutoDela
                              where a.sifraAutoDela == sifra
                              select new
                              {
                                  a.sifraAutoDela,
                                  a.Opis,
                                  a.Cena,
                                  m.Kolicina,
                                  d.nazivFirme
                              };
                              

                if (autoDeo.SingleOrDefault() == null)
                {
                    MessageBox.Show("Auto deo nije pronadjen",
                    "Obavestenje o upisu u bazu",
                    MessageBoxButton.OK, MessageBoxImage.Error);

                    tbSifraAutoDela.Clear();
                }
                else
                {
                    dataGrid.ItemsSource = autoDeo;
                    IzmenaTabele();
                }
                
            }

            



        }

        //Dozvoljava samo unos brojeva u textbox
        private void tbSifraAutoDela_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void IzmenaTabele()
        {
            dataGrid.Columns[0].Header = "Sifra";
            dataGrid.Columns[4].Header = "Dobavljac";
        }
    }
}
