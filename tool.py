import os
import subprocess
import tempfile
import PySimpleGUI as sg

# Define a função para carregar os hosts do arquivo de configuração
def get_hosts_list(config_file):
    try:
        with open(config_file, 'r') as f:
            config = f.read().splitlines()
        hosts = [h.split()[1] for h in config if h.startswith('Host ')]
    except:
        hosts = []
    return hosts

# Define o tamanho da janela e os elementos da interface
sg.theme('DefaultNoMoreNagging')
layout = [
    [sg.Text('Arquivo config: '), sg.Input(key='CONFIG_FILE', size=(40, 1)), sg.FileBrowse('Selecionar'), sg.Button('Ler')],
    [sg.Listbox(values=[], size=(50, 20), key='HOSTS_LIST', enable_events=True)],
    [sg.Button('Conectar'), sg.Button('Sair')],
    [sg.Text('', key='CONNECTED_HOST', size=(30, 1), justification='right')],
]
window = sg.Window('SSH', layout, resizable=True)
window.Finalize()

# Verifica se há um arquivo de configuração temporário e, se houver, usa seu valor para preencher a janela
temp_file = os.path.join(os.path.dirname(__file__), 'temp_config.txt')
if os.path.exists(temp_file):
    with open(temp_file, 'r') as f:
        config_file = f.read().strip()
        window['CONFIG_FILE'].update(config_file)
        # Carrega os hosts do arquivo de configuração
        hosts = get_hosts_list(config_file)
        window['HOSTS_LIST'].update(hosts)

# Loop principal da interface
while True:
    event, values = window.read()

    # Trata o evento de seleção do arquivo de configuração
    if event == 'Selecionar':
        config_file = values['CONFIG_FILE']
        window['CONFIG_FILE'].update(config_file)
        # Salva o caminho do arquivo de configuração em um arquivo temporário
        with open(temp_file, 'w') as f:
            f.write(config_file)

    # Trata o evento de leitura do arquivo de configuração
    elif event == 'Ler':
        config_file = values['CONFIG_FILE']
        # Carrega os hosts do arquivo de configuração
        hosts = get_hosts_list(config_file)
        window['HOSTS_LIST'].update(hosts)

    # Trata o evento de conexão
    elif event == 'Conectar' or (event == 'HOSTS_LIST' and len(values['HOSTS_LIST']) == 1 and values['HOSTS_LIST'][0]):
        selected_host = values['HOSTS_LIST'][0]
        if selected_host:
            # Abre uma nova janela do terminal com o SSH para o host selecionado
            if os.name == 'nt':  # Windows
                subprocess.Popen(f'start cmd /k "ssh {selected_host}"', shell=True)
            else:  # Linux/Unix
                subprocess.Popen(['x-terminal-emulator', '-e', f'ssh {selected_host}'])
            window['CONNECTED_HOST'].update(f'Conectado ao host {selected_host}')

    # Trata o evento de saída
    elif event == sg.WIN_CLOSED or event == 'Sair':
        break

window.close()