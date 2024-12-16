program DataMahasiswa;

uses crt;

type
    // Tipe data record untuk menyimpan informasi mahasiswa
    Mahasiswa = record
        NIM: string[10];       // NIM mahasiswa (maks 10 karakter)
        Nama: string[50];      // Nama mahasiswa (maks 50 karakter)
        Jurusan: string[30];   // Jurusan mahasiswa (maks 30 karakter)
    end;

var
    daftarMahasiswa: array[1..100] of Mahasiswa; // Array untuk menyimpan data mahasiswa
    jumlahMahasiswa: integer;                   // Jumlah mahasiswa yang sudah dimasukkan

// Prosedur untuk menambahkan data mahasiswa
procedure TambahMahasiswa();
var
    i: integer;
begin
    if jumlahMahasiswa < 100 then
    begin
        writeln('Masukkan data mahasiswa ke-', jumlahMahasiswa + 1);
        // Memasukkan data mahasiswa ke elemen berikutnya di array
        with daftarMahasiswa[jumlahMahasiswa + 1] do
        begin
            write('NIM: ');       // Meminta input NIM
            readln(NIM);
            write('Nama: ');      // Meminta input Nama
            readln(Nama);
            write('Jurusan: ');   // Meminta input Jurusan
            readln(Jurusan);
        end;
        // Menambahkan jumlah mahasiswa
        jumlahMahasiswa := jumlahMahasiswa + 1;
        writeln('Data mahasiswa berhasil ditambahkan!');
    end
    else
        // Pesan jika array sudah penuh
        writeln('Data mahasiswa sudah penuh!');
end;

// Prosedur untuk menampilkan daftar mahasiswa
procedure TampilkanMahasiswa();
var
    i: integer;
begin
    // Memeriksa apakah ada data mahasiswa
    if jumlahMahasiswa = 0 then
    begin
        writeln('Belum ada data mahasiswa.');
    end
    else
    begin
        writeln('Daftar Mahasiswa:');
        // Looping untuk menampilkan data semua mahasiswa
        for i := 1 to jumlahMahasiswa do
        begin
            with daftarMahasiswa[i] do
            begin
                writeln('NIM: ', NIM);          // Menampilkan NIM
                writeln('Nama: ', Nama);        // Menampilkan Nama
                writeln('Jurusan: ', Jurusan);  // Menampilkan Jurusan
                writeln('-------------------------');
            end;
        end;
    end;
end;

// Prosedur untuk mencari mahasiswa berdasarkan NIM
procedure CariMahasiswa();
var
    i: integer;
    nimCari: string[10];  // Variabel untuk menyimpan NIM yang dicari
    found: boolean;       // Penanda apakah data ditemukan
begin
    write('Masukkan NIM yang dicari: ');
    readln(nimCari);
    found := false;       // Inisialisasi penanda sebagai tidak ditemukan

    // Looping untuk mencari NIM di array
    for i := 1 to jumlahMahasiswa do
    begin
        if daftarMahasiswa[i].NIM = nimCari then
        begin
            writeln('Data Mahasiswa Ditemukan:');
            with daftarMahasiswa[i] do
            begin
                writeln('NIM: ', NIM);          // Menampilkan NIM
                writeln('Nama: ', Nama);        // Menampilkan Nama
                writeln('Jurusan: ', Jurusan);  // Menampilkan Jurusan
            end;
            found := true; // Menandai data ditemukan
            break;         // Keluar dari loop
        end;
    end;

    // Jika tidak ditemukan
    if not found then
        writeln('Data mahasiswa dengan NIM ', nimCari, ' tidak ditemukan.');
end;

var
    pilihan: integer;  // Variabel untuk menyimpan pilihan menu

begin
    clrscr;         
    jumlahMahasiswa := 0;  // Inisialisasi jumlah mahasiswa

    repeat
        // Menampilkan menu
        writeln('Menu:');
        writeln('1. Tambah Mahasiswa');
        writeln('2. Tampilkan Mahasiswa');
        writeln('3. Cari Mahasiswa');
        writeln('0. Keluar');
        write('Pilih menu: ');
        readln(pilihan);

        // Menjalankan prosedur berdasarkan pilihan menu
        case pilihan of
            1: TambahMahasiswa();       // Menambah data mahasiswa
            2: TampilkanMahasiswa();    // Menampilkan daftar mahasiswa
            3: CariMahasiswa();         // Mencari mahasiswa berdasarkan NIM
            0: writeln('Terima kasih!'); // Keluar dari program
        else
            // Pesan jika pilihan tidak valid
            writeln('Pilihan tidak valid, silakan coba lagi.');
        end;

        writeln; // Menambahkan baris kosong
    until pilihan = 0; // Program berjalan hingga pilihan 0 (keluar)

readln;
end.




















