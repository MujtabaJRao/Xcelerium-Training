#include <iostream>
using namespace std;


class Account {
private:
    int accountNumber;
    double balance;

public:
    Account(int accNum, double bal = 0) {
        accountNumber = accNum;
        balance = bal;
    }

    void deposit(double amount) {
        balance += amount;
        cout << "Deposited: " << amount << " | New Balance: " << balance << endl;
    }

    virtual void withdraw(double amount) { 
        cout << "Base withdraw (override in derived class)" << endl;
    }

    void displayBalance() {
        cout << "Account Number: " << accountNumber 
             << " | Balance: " << balance << endl;
    }

protected:
    double getBalance() { return balance; }
    void setBalance(double newBal) { balance = newBal; }
};


class SavingsAccount : public Account {
public:
    SavingsAccount(int accNum, double bal = 0) : Account(accNum, bal) {}

    void withdraw(double amount) override {
        if (amount > getBalance()) {
            cout << "Insufficient balance in Savings Account!\n";
        } else if (amount > 5000) {
            cout << "Savings Account withdrawal limit exceeded!\n";
        } else {
            setBalance(getBalance() - amount);
            cout << "Withdrawn: " << amount 
                 << " | New Balance: " << getBalance() << endl;
        }
    }
};


class CurrentAccount : public Account {
public:
    CurrentAccount(int accNum, double bal = 0) : Account(accNum, bal) {}

    void withdraw(double amount) override {
        double charge = 50; 
        if (amount + charge > getBalance()) {
            cout << "Insufficient balance in Current Account!\n";
        } else {
            setBalance(getBalance() - (amount + charge));
            cout << "Withdrawn: " << amount 
                 << " (Service Charge: " << charge << ")"
                 << " | New Balance: " << getBalance() << endl;
        }
    }
};

int main() {
    Account* acc1 = new SavingsAccount(101, 10000);
    Account* acc2 = new CurrentAccount(102, 8000);

    cout << "\n--- Savings Account ---\n";
    acc1->displayBalance();
    acc1->deposit(10000000);
    acc1->withdraw(6000);
    acc1->withdraw(3000);

    cout << "\n--- Current Account ---\n";
    acc2->displayBalance();
    acc2->deposit(1000);
    acc2->withdraw(5000);
    acc2->withdraw(4000);

    delete acc1;
    delete acc2;

    return 0;
}















































