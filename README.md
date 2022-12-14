## Jawab Pertanyaan Tugas 7

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Secara sederhana Stateless Widget dapat diartikan sebagai Widget yang tidak dapat dirubah atau tidak akan pernah berubah. Misal kita punya text "Saya Alfredo", maka mulai dari text tersebut dibuat sampai saat website itu berjalan, text tersebut akan selalu menjadi "Saya Alfredo". Contoh penggunaan stateless widget adalah pada halaman about us karena informasi pada halaman tersebu bersifat statis dan tidak perlu ada perubahan.<br/><br/>
Stateful widget adalah widget yang dinamis atau dapat berubah, stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris, dan lain-lain. Apapun widget yang dapat berubah itulah disebut stateful widget. <br>
Pada stateless widget, kita tidak dapat menggunakan setState dan setState hanya ada pada stateful widget yang akan memberi tahu widget bahwa terdapat object yang berubah pada state, sehingga akan melakukan build ulang pada widget tersebut.<br>

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

1. Scaffold: Mengimplementasi desain material sederhana agar aplikasi dapat ditaruh
2. Appbar: Membuat "navbar" atau lebih formalnya membuat toolbar
3. Center: Menaruh widget-widget di tengah
4. MainAxisAlignment: Melakukan alignment center
5. FloatingActionButton: Membuat button floating yang dapat ditekan dan menjalankan fungsi
6. Padding: Widget yang dapat memberikan padding
7. Text: Menuliskan text yang dapat di styling
8. Column: Melakukan layout elemen-elemen flutter dalam posisi vertikal
9. Row: Melakukan layout elemen flutter dalam posisi horizontal
10. TextStyle: Styling untuk text
11. Icon: Memberikan icon

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState digunakan untuk mengedit state pada stateful widget, karena setState akan melakukan build ulang apabila di trigger ulang. Sederhananya, setState digunakan untuk melakukan build ulang widget widget yang dipakai dan anak-anaknya. Variabel yang terdampak di lab kali ini adalah variabel \_counter dan variabel isGenap karena setiap kali tombol dipencat, akan terjadi perubahan state dan setState akan melakukan issue untuk build ulang

### Jelaskan perbedaan antara const dengan final.

Const tidak dapat digunakan saat kita tidak tahu valuenya saat waktu compile (compile-time), sehingga method-method seperti datetime.now() tidak akan bekerja karena valuenya tidak ditemukan/diketahui saat waktu program melakukan compile (atau run-time). Sedangkan final sebaiknnya digunakan apabila kita tidak tahu value yang akan muncul saat waktu compile. Semuanya yang memerlukan pengetahuan/informasi saat run-time diharuskan memakai final. Perbedaan kedua ditemukan saat kita membuat final object, object didalam final bisa diedit namun sebuah const object tidak memperbolehkan fieldnya terupdate.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat create project flutter
2. Mengedit project tersebut dengan menambahkan widget Padding dan FloatingActionButton agar dapat diletakkan di kiri bawah dan kanan bawah.
3. Menambah variabel \_counter dan isGenap fungsi increment dan decrement dengan useState
4. Menerapkan styling pada hal-hal yang diperlukan seperti tulisan genap dan ganjil
5. Menerapkan ternary operator untuk melakukan filter informasi yang masuk ke dalam flutter application
6. Menerapkan bonus dengan cara ternary operator juga dengan if statement saat \_counter <= 0

## Jawab Pertanyaan Tugas 8

### Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Navigator.push akan menambahkan route ke stack berisi routes yang di manage oleh Navigator, sedangkan Navigator.pushReplacement akan menambahkan route ke stack berisi routes dan membuang/mereplace route sebelumnya berada pada stack apabila route yang sekarang telah selesai di load. Esensialnya Navigator.push tidak akan melakukan "pop" route karena hal yang dilakukannya adalah push. Namun Navigator.pushReplacement akan melakukan push sekaligus pop dalam waktu bersamaan sehingga memori yang digunakan akan semakin baik.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

-   Drawer -> Widget yang merender navigation drawer yang bisa dibuka dan ditutup sesuai gestur yang dipakai (Navigation menu)
-   ListTile -> Widget yang digunakan untuk mengisi ListView (tidak selamanya), namun juga terdiri atas leading dan trailing serta title didalamnya
-   Form -> Container yang menampung field=field pada form
-   ListView -> Sangat umum digunakan untuk widget yang dapat di scroll, berbeda dengan column
-   SizedBox -> Semacam div pada flutter yang dapat mempunyai tinggi dan lebar
-   TextFormField -> Semacam text field untuk form
-   DropdownButtonFormField -> Semacam dropdown untuk form
-   Padding dan EdgeInsets -> Mengatur Padding
-   Icon -> Menampilkan Icon
-   TextButton -> Button yang mempunyai teks dan event listener
-   dan masih banyak fungsinya seperti OutlinedButton (merupakan text button dengan fungsi lebih advanced)

### Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

-   onPressed
-   onChange
-   onSaved
-   onTap

### Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator berfungsi dengan menyimpan stack dari route-route yang digunakan app. Di mana route tersebut merupakan widget yang berupa page baru. Terdapat method push untuk berpindah ke route yang ditentukan dengan builder yang diberikan, yang menghasilkan widget page yang dituju. Serta pop atau back button yang berguna untuk kembali ke page sebelumnya.

### Cara implementasi

-   Memindahkan file drawer ke satu file tersendiri pada folder widgets
-   Membuat page tambah budget pada file form_page.dart pada folder pages
-   Menyimpan data di budget.dart pada folder models
-   Membuat page untuk melihat data pada data_page.dart di folder pages yang mengambil data dari model yang sudah dibuat

## Jawab Pertanyaan Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa, namun pengambilan data JSON akan lebih baik jika dibuat model terlebih dahulu karena model akan memudahkan kita dalam mengambil data JSON yang kita inginkan. Selain itu, pengambilan data tanpa model sangat vurnerable terhadap error karena kita tidak tahu data apa saja yang akan kita ambil.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

-   Scaffold -> Widget yang digunakan untuk membuat layout pada flutter
-   ListView -> Widget yang dapat di scroll tidak seperti widget Column
-   Row, Column -> Widget yang mengatur layout suatu children didalamnya
-   OutlinedButton -> Widget yang digunakan untuk membuat button
-   Text -> Widget yang digunakan untuk menampilkan text
-   SizedBox -> Widget yang digunakan untuk membuat jarak antar widget
-   Padding -> Widget yang digunakan untuk membuat jarak antardalam widget
-   Icon -> Widget yang digunakan untuk menampilkan icon
-   Drawer -> Widget yang digunakan untuk membuat navigation drawer
-   ListTile -> Widget yang digunakan untuk membuat list
-   dan masih banyak lagi

### Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

Http Package adalah library yang dipakai guna mendapatkan http request. Http akan melakukan fetching data dalam dan mereturn http response. Response tersebut akan di decode menggunakan jsonDecode() yang akan menghasilkan data-data JSON dalam bentuk Map. Data-data Map tersebut akan kemudian diolah sehingga data-data dalam bentuk Map tersebut dapat menjadi data-data pada objek yang merupakan Model instance yang sesuai dengan struktur JSON tersebut.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

-   Menambahkan widget baru yang merupakan MyWatchListPage pada file drawer di folder widgets
-   Membuat page yang menampilkan My Watch List hasil fetch data dari heroku tugas 3 pada folder pages
-   Melakukan juga refactoring fetch data function ke file terpisah pada folder services
-   Menambahkan checklist button dan see details yang mengarahkan ke page baru yaitu DetailMyWatchListPage pada folder pages
-   Membuat page untuk melihat detail-detail dari elemen yang di klik see detailsnya
