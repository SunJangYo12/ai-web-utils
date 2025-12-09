import re
import sys

def srt_to_vtt(srt_text):
    # Tambah header
    vtt = "WEBVTT\n\n"

    # Ubah koma menjadi titik
    vtt += re.sub(r"(\d+),(\d+)", r"\1.\2", srt_text)

    # Hapus nomor index (misal "1", "2", dst)
    vtt = re.sub(r"^\d+\s*$", "", vtt, flags=re.MULTILINE)

    # Hapus spasi kosong berlebihan
    vtt = re.sub(r"\n{3,}", "\n\n", vtt)

    return vtt.strip() + "\n"

def main():
    if len(sys.argv) != 3:
        print("Usage: python srt_to_vtt.py input.srt output.vtt")
        return

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    with open(input_file, "r", encoding="utf-8") as f:
        srt_text = f.read()

    vtt_text = srt_to_vtt(srt_text)

    with open(output_file, "w", encoding="utf-8") as f:
        f.write(vtt_text)

    print(f"Converted: {input_file} → {output_file}")

if __name__ == "__main__":
    main()
