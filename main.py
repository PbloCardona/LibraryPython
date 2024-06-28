import tkinter as tk
from tkinter import ttk
import requests
import json

base_url = "https://holatxt.000webhostapp.com"

def obtener_datos():
    try:
        respuesta = requests.get(f"{base_url}/get.php")
        if respuesta.status_code == 200:
            try:
                datos = respuesta.json()
                mostrar_datos_en_tabla(datos)
            except json.JSONDecodeError:
                resultado_label.config(text="Error al decodificar JSON")
        else:
            resultado_label.config(text="Error al obtener datos: " + respuesta.text)
    except requests.exceptions.RequestException as e:
        resultado_label.config(text=f"Error en la solicitud: {e}")

def mostrar_datos_en_tabla(datos):
    tabla.delete(*tabla.get_children())
    for dato in datos:
        tabla.insert('', 'end', values=(dato['id'], dato['titulo'], dato['autor'], dato['fecha_lanzamiento']))

def enviar_solicitud(url, data):
    try:
        respuesta = requests.post(url, data=json.dumps(data), headers={"Content-Type": "application/json"})
        if respuesta.status_code == 200:
            obtener_datos()
            resultado_label.config(text="Operación completada correctamente")
        else:
            resultado_label.config(text=f"Error en la operación: " + respuesta.text)
    except requests.exceptions.RequestException as e:
        resultado_label.config(text=f"Error en la solicitud: {e}")

def agregar_dato():
    enviar_solicitud(f"{base_url}/post.php", {
        "titulo": titulo_entry.get(),
        "autor": autor_entry.get(),
        "fecha_lanzamiento": fecha_lanzamiento_entry.get()
    })

def actualizar_dato():
    selected_item = tabla.selection()
    if selected_item:
        id_dato = tabla.item(selected_item)['values'][0]
        enviar_solicitud(f"{base_url}/put.php", {
            "id": id_dato,
            "titulo": titulo_entry.get(),
            "autor": autor_entry.get(),
            "fecha_lanzamiento": fecha_lanzamiento_entry.get()
        })
    else:
        resultado_label.config(text="Selecciona un dato para actualizar")

def eliminar_dato():
    selected_item = tabla.selection()
    if selected_item:
        id_dato = tabla.item(selected_item)['values'][0]
        enviar_solicitud(f"{base_url}/delete.php", {"id": id_dato})
    else:
        resultado_label.config(text="Selecciona un dato para eliminar")

def on_treeview_select(event):
    selected_item = tabla.selection()
    if selected_item:
        item = tabla.item(selected_item)
        values = item['values']
        titulo_entry.delete(0, tk.END)
        titulo_entry.insert(0, values[1])
        autor_entry.delete(0, tk.END)
        autor_entry.insert(0, values[2])
        fecha_lanzamiento_entry.delete(0, tk.END)
        fecha_lanzamiento_entry.insert(0, values[3])

def limpiar_campos():
    titulo_entry.delete(0, tk.END)
    autor_entry.delete(0, tk.END)
    fecha_lanzamiento_entry.delete(0, tk.END)

root = tk.Tk()
root.title("Gestión de Datos")

groupBox = tk.LabelFrame(root, text="", padx=10, pady=10)
groupBox.grid(row=4, column=0, padx=20, pady=25)

tk.Label(groupBox, text="TÍTULO:").grid(row=0, column=0, pady=12)
titulo_entry = tk.Entry(groupBox, width=45)
titulo_entry.grid(row=0, column=1, pady=12)

tk.Label(groupBox, text="AUTOR:").grid(row=1, column=0, pady=12)
autor_entry = tk.Entry(groupBox, width=45)
autor_entry.grid(row=1, column=1, pady=12)

tk.Label(groupBox, text="FECHA DE LANZAMIENTO:").grid(row=2, column=0, pady=12)
fecha_lanzamiento_entry = tk.Entry(groupBox, width=45)
fecha_lanzamiento_entry.grid(row=2, column=1, pady=12)

groupBox = tk.LabelFrame(root, text="", padx=10, pady=10)
groupBox.grid(row=4, column=1, padx=20, pady=25)
tk.Button(groupBox, text="ACTUALIZAR LISTADO", width=28, command=obtener_datos).grid(row=3, column=0, pady=10, padx=8)
tk.Button(groupBox, text="AGREGAR NUEVO", width=28, command=agregar_dato).grid(row=3, column=1, pady=10, padx=8)
tk.Button(groupBox, text="ACTUALIZAR SELECCIÓN", width=28, command=actualizar_dato).grid(row=4, column=0, pady=10, padx=8)
tk.Button(groupBox, text="ELIMINAR SELECCIÓN", width=28, command=eliminar_dato).grid(row=4, column=1, pady=10, padx=8)
tk.Button(groupBox, text="LIMPIAR CAMPOS", width=28, command=limpiar_campos).grid(row=5, column=0, columnspan=2, pady=10, padx=8)

groupBox = tk.LabelFrame(root, text="LISTADO:", padx=10, pady=10)
groupBox.grid(row=5, column=0, columnspan=2, padx=20, pady=25)
tabla = ttk.Treeview(groupBox, columns=('ID', 'Título', 'Autor', 'Fecha de Lanzamiento'), show='headings')
tabla.heading('ID', text="ID")
tabla.heading('Título', text="Título")
tabla.heading('Autor', text="Autor")
tabla.heading('Fecha de Lanzamiento', text="Fecha de Lanzamiento")
tabla.pack(pady=10)
tabla.bind('<<TreeviewSelect>>', on_treeview_select)

resultado_label = tk.Label(root, text="")
resultado_label.grid(row=6, column=0, columnspan=2, pady=10)

root.mainloop()
