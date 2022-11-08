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
