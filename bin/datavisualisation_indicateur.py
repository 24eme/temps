import matplotlib.pyplot as plt
import csv
 
tab = []
with open('indicateurs.csv', 'r') as f:
    lines = csv.reader(f, delimiter=',')
    for row in lines:
        row.pop(0)
        row = ['0' if i=='' else i for i in row]
        tab.append(row)

date = tab[0]
facture = [float(i.replace(",",".")) for i in tab[1]]
jours_restant = [float(i.replace(",",".")) for i in tab[2]]
charges = [float(i.replace(",",".")) for i in tab[3]]
treso = [float(i.replace(",",".")) for i in tab[4]]


fig = plt.figure()
fig.canvas.manager.set_window_title('Les indicateurs du 24ème')
fig.set_size_inches(20, 12)

plt.subplot(2, 2, 1)
plt.plot(date, facture, color = 'r', linestyle = 'dashed',marker = 'o',label = "Montant Facturé")
plt.xticks([])
plt.title("Montant Facturé")

plt.subplot(2, 2, 3)
plt.plot(date, jours_restant, color = 'g', linestyle = 'dashed',marker = 'o',label = "Jours restant")
plt.xticks([])
plt.title("Jours restants")

plt.subplot(2, 2, 2)
plt.plot(date, charges, color = 'b', linestyle = 'dashed',marker = 'o',label = "Charges")
plt.xticks([])
plt.title("Charges")

plt.subplot(2, 2, 4)
plt.plot(date, treso, color = 'y', linestyle = 'dashed',marker = 'o',label = "Trésorerie")
plt.xticks([])
plt.title("Trésorerie")

plt.show()