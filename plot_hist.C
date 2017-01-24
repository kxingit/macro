{
    TTree *MyTree = new TTree("MyTree", "MyTree"); 
    MyTree->ReadFile("test1.csv", "WCS/D");
    MyTree->SetEstimate(-1);
    MyTree->SetMarkerSize(2);
    MyTree->Draw("WCS");
    c1->Print("WCS.png");
}
