import random
from colorama import init, Fore, Style


init(autoreset=True)

def generate_six_digit_number(exclude_numbers):
    while True:
        code = random.randint(100000, 999999)
        if code not in exclude_numbers:
            return code

def main():
print(Fore.RED +'                                          ╔══════════════════════════════════════════════════╗')                                                  
print(Fore.RED +'                                          ║ ▄▄▄· ▄• ▄▌▄▄▄▄▄ ▄ .▄     ▄▄· ▄▄▄   ▄▄▄·  ▄▄· ▄ •▄║')
print(Fore.RED +'                                          ║▐█ ▀█ █▪██▌•██  ██▪▐█    ▐█ ▌▪▀▄ █·▐█ ▀█ ▐█ ▌▪█▌▄ ║')
print(Fore.RED +'                                          ║▄█▀▀█ █▌▐█▌ ▐█.▪██▀▐█    ██ ▄▄▐▀▀▄ ▄█▀▀█ ██ ▄▄▐▀▀ ║')
print(Fore.RED +'                                          ║ █ ▪▐▌▐█▄█▌ ▐█▌·██▌▐▀    ▐███▌▐█•█▌▐█ ▪▐▌▐███▌▐█.█║')
print(Fore.RED +'                                          ║ ▀  ▀  ▀▀▀  ▀▀▀ ▀▀▀ ·    ▀▀▀ .▀  ▀ ▀  ▀ ·▀▀▀ ·▀  █║')
print(Fore.RED +'                                          ╚══════════════════════════════════════════════════╝')
  
    count = input(Fore.CYAN +"╚══════>> Select number of 2FA codes you want to see. might take some time.")
    
    if not count.isdigit() or int(count) < 1:
        print("Invalid input. Please enter a number greater than 0.")
        return
    
    exclude_file = input(Fore.CYAN +"╚══════>> Enter the filename containing numbers to exclude: ")
    
    try:
        with open(exclude_file, 'r') as file:
            exclude_numbers = {int(line.strip()) for line in file if line.strip().isdigit()}
    except FileNotFoundError:
        print(Fore.RED + f"The file {exclude_file} does not exist.")
        return
    except Exception as e:
        print(Fore.RED + f"An error occurred: {e}")
        file.close()
        return        
    
    for i in range(1, int(count) + 1):
        code = generate_six_digit_number(exclude_numbers)
        print(Colors.GREEN + "2FA code {i}: {code}")
        file.close()

if __name__ == "__main__":
    main()
