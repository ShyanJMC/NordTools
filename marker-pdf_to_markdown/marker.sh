#!/bin/bash

clear
echo "=================================================="
echo "Marker: AI to transform from PDF to Markdown files"
echo -e "Note:\n\tIf you have 3GB VRAM NVIDIA GPU use this environment variable at start of each call; TORCH_DEVICE=cuda"
echo -e "\tIf you don't have it, marker will use CPU by default."
echo "=================================================="
echo -e "\n\nusage for single file transformation:"
echo -e "\t/opt/marker-0.2.17/conver_single.py [options] [input_PDF] /data/outputs/[output_markdown]"
echo -e "\n\tOptions:\n\t --batch_multiplier is how much to multiply default batch sizes by if you have extra VRAM. Higher numbers will take more VRAM, but process faster. Set to 2 by default. The default batch sizes will take ~3GB of VRAM."
echo -e "\t --max_pages is the maximum number of pages to process. Omit this to convert the entire document."
echo -e "\t --langs is an optional comma separated list of the languages in the document, for OCR. Optional by default, required if you use tesseract."
echo -e "\t --ocr_all_pages is an optional argument to force OCR on all pages of the PDF. If this or the env var OCR_ALL_PAGES are true, OCR will be forced."
echo "=================================================="
echo -e "\n\nusage for convert multiple files:"
echo -e "\t//opt/marker-0.2.17/chunk_convert.py [options] [input_PDF_directory] /data/outputs/[output_markdown_directory]"
echo -e "\n\tOptions:\n\t --workers is the number of pdfs to convert at once. This is set to 1 by default, but you can increase it to increase throughput, at the cost of more CPU/GPU usage. Marker will use 5GB of VRAM per worker at the peak, and 3.5GB average."
echo -e "\t --max is the maximum number of pdfs to convert. Omit this to convert all pdfs in the folder."
echo -e "\t --min_length is the minimum number of characters that need to be extracted from a pdf before it will be considered for processing. If you're processing a lot of pdfs, I recommend setting this to avoid OCRing pdfs that are mostly images. (slows everything down)"
echo -e "\t --metadata_file is an optional path to a json file with metadata about the pdfs. If you provide it, it will be used to set the language for each pdf. Setting language is optional for surya (default), but required for tesseract."

echo -e "\n
{
  "pdf1.pdf": {"languages": ["English"]},
  "pdf2.pdf": {"languages": ["Spanish", "Russian"]},
  ...
}
"
echo "=================================================="
echo -e "\n\nusage for convert multiple files with multiple GPUs:"
echo -e "\tMIN_LENGTH=10000 METADATA_FILE=../pdf_meta.json NUM_DEVICES=4 NUM_WORKERS=15 /opt/marker-0.2.17/chunk_convert.py [options] [input_PDF_directory] /data/outputs/[output_markdown_directory]"

if [ ! -d /data ]; then
	echo -e "\n"
	echo -e "[ERR] /data directory do not exist"
else
	if [ ! -d /data/outputs/ ]; then
		mkdir /data/outputs/
		echo -e "\n"
		echo "[INFO] Created outputs folder"
	fi
fi

/bin/bash
