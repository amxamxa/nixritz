# matrix mit bunten Unicode 

./nixritz-uni.sh   funzt
 
 **test mit:**
 ```sh
  # Ornamentale Dingbats (0x1F300 - 0x1F5FF)
  for code in {127744..128511}; do printf "\U$(printf '%x' $code) "; done
 
 # Transport und Karte (0x1F680 - 0x1F6FF)
  for code in {128640..128767}; do printf "\U$(printf '%x' $code) "; done
 
 # Bürobedarf (0x1F4F0 - 0x1F4FF)
  for code in {128240..128255}; do printf "\U$(printf '%x' $code) "; done
 
 # Emoticons (0x1F600 - 0x1F64F)
  for code in {128512..128591}; do printf "\U$(printf '%x' $code) "; done
 ```

# matrix mit bunten Letters
./nixritz-dev.sh   funzt

#  matrix mit bunten Zahlen
./nixritz.sh   funzt

#TODO:
- [x] so anpassen ,dass die Buchstaben weiter fallen, dann aber bei FUCK oder fuck eingeloggt bleiben
