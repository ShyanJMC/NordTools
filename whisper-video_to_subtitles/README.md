# Whisper

Whisper is an IA tool to detect the audio in a video or in mp3/wav audio file to subtitle file with timestamps.

Whisper repository; https://github.com/openai/whisper

## Requirements

- [ ] Dedicated NVIDIA GPU (because Marker can use CUDA cores) with more or less 3GB of VRAM (Video RAM) available in dedicated NVIDIA GPU.
- [ ] If above is not possible (3GB of VRAM or NVIDIA GPU) you can use the CPU by default.

## Architecture

Use a Debian distribution container to run the program locally.

And use a volume to transfer the video/audio files between the machine and the container.

The program is in /opt.

## Build

1. Build the image from scratch runing this from this directory;

> [docker/podman] build -t whisper:20231117 .

2. Install "nvidia-container-toolkit" and "podman-docker" (if you use podman instead docker)

3. Configure nvidia-container-toolkit to use podman or docker (in both cases is docker)

> sudo nvidia-ctk runtime configure --runtime=docker

## Usage

1. Run the container with a volume pointing to /data

> [docker/podman] -ti -v [directory_or_volume]:/data --gpus all localhost/whisper:20231117 /usr/bin/bash

### Whisper usage

Available languages:

```bash
af,am,ar,as,az,ba,be,bg,bn,bo,br,bs,ca,cs,cy,da,de,el,en,es,et,eu,fa,fi,fo,fr,gl,gu,ha,haw,he,hi,hr,ht,hu,hy,id,is,it,ja,jw,ka,kk,km,kn,
ko,la,lb,ln,lo,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,my,ne,nl,nn,no,oc,pa,pl,ps,pt,ro,ru,sa,sd,si,sk,sl,sn,so,sq,sr,su,sv,sw,ta,te,tg,th,tk,tl,
tr,tt,uk,ur,uz,vi,yi,yo,yue,zh,Afrikaans,Albanian,Amharic,Arabic,Armenian,Assamese,Azerbaijani,Bashkir,Basque,Belarusian,Bengali,Bosnian,
Breton,Bulgarian,Burmese,Cantonese,Castilian,Catalan,Chinese,Croatian,Czech,Danish,Dutch,English,Estonian,Faroese,Finnish,Flemish,French,
Galician,Georgian,German,Greek,Gujarati,Haitian,Haitian Creole,Hausa,Hawaiian,Hebrew,Hindi,Hungarian,Icelandic,Indonesian,Italian,Japanese,
Javanese,Kannada,Kazakh,Khmer,Korean,Lao,Latin,Latvian,Letzeburgesch,Lingala,Lithuanian,Luxembourgish,Macedonian,Malagasy,Malay,Malayalam,
Maltese,Mandarin,Maori,Marathi,Moldavian,Moldovan,Mongolian,Myanmar,Nepali,Norwegian,Nynorsk,Occitan,Panjabi,Pashto,Persian,Polish,Portuguese,
Punjabi,Pushto,Romanian,Russian,Sanskrit,Serbian,Shona,Sindhi,Sinhala,Sinhalese,Slovak,Slovenian,Somali,Spanish,Sundanese,Swahili,Swedish,
Tagalog,Tajik,Tamil,Tatar,Telugu,Thai,Tibetan,Turkish,Turkmen,Ukrainian,Urdu,Uzbek,Valencian,Vietnamese,Welsh,Yiddish,Yoruba
```
1. Transcribe audio to text

> whisper --task {transcribe,translate} --output_dir /data --language [language] --output_format {txt,vtt,srt,tsv,json,all} --word_timestamps True --max_words_per_line [MAX_WORDS_PER_LINE] --threads [THREADS] [archive]

